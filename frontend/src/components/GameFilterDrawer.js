import { Button, Checkbox, Divider, Drawer, FormControl, FormControlLabel, FormGroup, FormLabel, makeStyles } from "@material-ui/core"
import React, { useEffect, useState } from "react";

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
    const { window, defaultFilters } = props;
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
            if (filterGroup.value != event.target.name) {
                return {
                    ...filterGroup
                }
            } else {
                return {
                    ...filterGroup,
                    ['items']: filterGroup.items.map((item) => {
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
            if (filterGroup.value != event.currentTarget.name) {
                return {
                    ...filterGroup
                }
            } else {
                return {
                    ...filterGroup,
                    ['showMore']: !filterGroup.showMore
                }
            }
        }))
    }

    const filtersHtml = filters.map((filter) =>
        <React.Fragment key={filter.value}>
            <FormLabel component="legend">{filter.label}</FormLabel>
            <FormGroup>
                {filter.items.map((gItem, index) => {
                    const template = (
                        <FormControlLabel
                            key={`${filter.value}-${gItem.value}`}
                            control={<Checkbox
                                        onChange={handleChangeFilter}
                                        name={filter.value}
                                        value={gItem.value.toString()}
                                        checked={gItem.checked}
                                    />}
                            label={gItem.label}
                        />
                    );

                    if (index < 5) {
                        return template;
                    } else if (filter.showMore) {
                        return template;
                    } else {
                        return null;
                    }
                })}
                {(filter.items.length > 5) ?
                    <Button name={filter.value} onClick={handleFilterGroupToggle}>
                        { filter.showMore ? 'Less' : 'More' }
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

    const filtersToQueryString = () => {
        let qs = [];
        let i, j;
        for (i = 0; i < filters.length; i++) {
            for (j = 0; j < filters[i].items.length; j++) {
                if (filters[i].items[j].checked) {
                    qs.push(encodeURIComponent(filters[i].value) + '=' + encodeURIComponent(filters[i].items[j].value))
                }
            }
        }
        return qs.join('&');
    }

    useEffect(() => {
        if (props.onChange) {
            props.onChange(filtersToQueryString())
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