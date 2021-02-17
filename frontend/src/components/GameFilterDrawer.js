import { Button, Checkbox, Divider, Drawer, FormControl, FormControlLabel, FormGroup, FormLabel, makeStyles } from "@material-ui/core"
import { useEffect, useState } from "react";
import React from "react";

const drawerWidth = 300;

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  // necessary for content to be below app bar
  toolbar: theme.mixins.toolbar,
  drawerPaper: {
    width: drawerWidth,
  },
  formControl: {
    margin: theme.spacing(2),
  },
}));

const GameFilterDrawer = (props) => {
    const classes = useStyles();
    const defaultFilters = [
        {
            groupValue: 'subscription',
            groupLabel: 'Stadia Pro',
            groupShowMore: false,
            groupItems: [
                {
                    label: 'Free with Pro',
                    value: 'free',
                    checked: false,
                },
            ],
        },
        {
            groupValue: 'esrb',
            groupLabel: 'ESRB rating',
            groupShowMore: false,
            groupItems: [
                {
                    label: 'Everyone',
                    value: 'E',
                    checked: false,
                },
                {
                    label: 'Everyone 10+',
                    value: 'E10+',
                    checked: false,
                },
                {
                    label: 'Teen',
                    value: 'T',
                    checked: false,
                },
                {
                    label: 'Mature 17+',
                    value: 'M',
                    checked: false,
                },
                {
                    label: 'Not available',
                    value: 'NA',
                    checked: false,
                },
            ],
        },
        {
            groupValue: 'genre',
            groupLabel: 'Genre',
            groupShowMore: false,
            groupItems: props.genres.map((genre) => {
                return {
                    label: genre.name,
                    value: genre.id,
                    checked: false,
                }
            }),
        },
    ]

    const { window } = props;
    const [drawerOpen, setDrawerOpen] = useState(false);
    const [filters, setFilters] = useState(defaultFilters);

    const container = window !== undefined ? () => window().document.body : undefined;

    const handleDrawerToggle = () => {
        setDrawerOpen(!drawerOpen);
    };

    const handleClearFilters = (event) => {
        setFilters(defaultFilters)
    }

    const handleChangeFilter = (event) => {
        setFilters(filters.map((filterGroup) => {
            if (filterGroup.groupValue != event.target.name) {
                return {
                    ...filterGroup
                }
            } else {
                return {
                    ...filterGroup,
                    ['groupItems']: filterGroup.groupItems.map((item) => {
                        if (item.value.toString() != event.target.value) {
                            return {
                                ...item
                            }
                        } else {
                            return {
                                ...item,
                                ['checked']: !item.checked
                            }
                        }
                    })
                }
            }
        }))
    };

    const handleFilterGroupToggle = (event) => {
        setFilters(filters.map((filterGroup) => {
            if (filterGroup.groupValue != event.currentTarget.name) {
                return {
                    ...filterGroup
                }
            } else {
                return {
                    ...filterGroup,
                    ['groupShowMore']: !filterGroup.groupShowMore
                }
            }
        }))
    }

    const filtersHtml = filters.map((filter) =>
        <React.Fragment key={filter.groupValue}>
            <FormLabel component="legend">{filter.groupLabel}</FormLabel>
            <FormGroup>
                {filter.groupItems.map((gItem, index) => {
                    const template = (
                        <FormControlLabel
                            key={`${filter.groupValue}-${gItem.value}`}
                            control={<Checkbox
                                        onChange={handleChangeFilter}
                                        name={filter.groupValue}
                                        value={gItem.value.toString()}
                                        checked={gItem.checked}
                                    />}
                            label={gItem.label}
                        />
                    );

                    if (index < 5) {
                        return template;
                    } else if (filter.groupShowMore) {
                        return template;
                    } else {
                        return null;
                    }
                })}
                {(filter.groupItems.length > 5) ?
                    <Button name={filter.groupValue} onClick={handleFilterGroupToggle}>
                        { filter.groupShowMore ? 'Less' : 'More' }
                    </Button>
                    :
                    null
                }
            </FormGroup>
        </React.Fragment>
    );

    const drawer = (
        <div>
            <div className={classes.toolbar}>
                <Button onClick={handleClearFilters}>Clear</Button>
            </div>
            <Divider />
            <FormControl component="fieldset" className={classes.formControl}>
                {filtersHtml}
            </FormControl>
        </div>
    );

    useEffect(() => {
        if (props.onChange) {
            props.onChange(filters)
        }
    }, [filters]);
  
    return (
        <>
            <Button onClick={handleDrawerToggle}>Filter</Button>
            <nav className={classes.drawer} aria-label="manu drawer">
                <Drawer
                container={container}
                variant="temporary"
                anchor="right"
                open={drawerOpen}
                onClose={handleDrawerToggle}
                classes={{
                    paper: classes.drawerPaper
                }}
                ModalProps={{
                    keepMounted: true, // Better open performance on mobile.
                }}
                >
                    {drawer}
                </Drawer>
            </nav>
        </>
    );
}

export default GameFilterDrawer;