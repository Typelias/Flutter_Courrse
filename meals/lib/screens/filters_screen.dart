import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Gluten-Free',
                  'Only include Gluten-Free meals',
                  _glutenFree,
                  (nextValue) {
                    setState(() {
                      _glutenFree = nextValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Lactose-Free',
                  'Only include Lactose-Free meals',
                  _lactoseFree,
                  (nextValue) {
                    setState(() {
                      _lactoseFree = nextValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _vegetarian,
                  (nextValue) {
                    setState(() {
                      _vegetarian = nextValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (nextValue) {
                    setState(() {
                      _vegan = nextValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
