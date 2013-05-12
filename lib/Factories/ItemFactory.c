/* ItemFactory.c generated by valac 0.20.1.4-f5a54, the Vala compiler
 * generated from ItemFactory.vala, do not modify */

/**/
/*  Copyright (C) 2011 Robert Dyer*/
/**/
/*  This program is free software: you can redistribute it and/or modify*/
/*  it under the terms of the GNU General Public License as published by*/
/*  the Free Software Foundation, either version 3 of the License, or*/
/*  (at your option) any later version.*/
/**/
/*  This program is distributed in the hope that it will be useful,*/
/*  but WITHOUT ANY WARRANTY; without even the implied warranty of*/
/*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*/
/*  GNU General Public License for more details.*/
/**/
/*  You should have received a copy of the GNU General Public License*/
/*  along with this program.  If not, see <http://www.gnu.org/licenses/>.*/
/**/

#include <glib.h>
#include <glib-object.h>


#define SHELF_FACTORIES_TYPE_ITEM_FACTORY (shelf_factories_item_factory_get_type ())
#define SHELF_FACTORIES_ITEM_FACTORY(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), SHELF_FACTORIES_TYPE_ITEM_FACTORY, ShelfFactoriesItemFactory))
#define SHELF_FACTORIES_ITEM_FACTORY_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), SHELF_FACTORIES_TYPE_ITEM_FACTORY, ShelfFactoriesItemFactoryClass))
#define SHELF_FACTORIES_IS_ITEM_FACTORY(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), SHELF_FACTORIES_TYPE_ITEM_FACTORY))
#define SHELF_FACTORIES_IS_ITEM_FACTORY_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), SHELF_FACTORIES_TYPE_ITEM_FACTORY))
#define SHELF_FACTORIES_ITEM_FACTORY_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), SHELF_FACTORIES_TYPE_ITEM_FACTORY, ShelfFactoriesItemFactoryClass))

typedef struct _ShelfFactoriesItemFactory ShelfFactoriesItemFactory;
typedef struct _ShelfFactoriesItemFactoryClass ShelfFactoriesItemFactoryClass;
typedef struct _ShelfFactoriesItemFactoryPrivate ShelfFactoriesItemFactoryPrivate;

struct _ShelfFactoriesItemFactory {
	GObject parent_instance;
	ShelfFactoriesItemFactoryPrivate * priv;
};

struct _ShelfFactoriesItemFactoryClass {
	GObjectClass parent_class;
};


static gpointer shelf_factories_item_factory_parent_class = NULL;

GType shelf_factories_item_factory_get_type (void) G_GNUC_CONST;
enum  {
	SHELF_FACTORIES_ITEM_FACTORY_DUMMY_PROPERTY
};
ShelfFactoriesItemFactory* shelf_factories_item_factory_new (void);
ShelfFactoriesItemFactory* shelf_factories_item_factory_construct (GType object_type);


ShelfFactoriesItemFactory* shelf_factories_item_factory_construct (GType object_type) {
	ShelfFactoriesItemFactory * self = NULL;
#line 25 "/home/gwen/Programmation/vala/vala-sandbox/lib/Factories/ItemFactory.vala"
	self = (ShelfFactoriesItemFactory*) g_object_new (object_type, NULL);
#line 25 "/home/gwen/Programmation/vala/vala-sandbox/lib/Factories/ItemFactory.vala"
	return self;
#line 63 "ItemFactory.c"
}


ShelfFactoriesItemFactory* shelf_factories_item_factory_new (void) {
#line 25 "/home/gwen/Programmation/vala/vala-sandbox/lib/Factories/ItemFactory.vala"
	return shelf_factories_item_factory_construct (SHELF_FACTORIES_TYPE_ITEM_FACTORY);
#line 70 "ItemFactory.c"
}


static void shelf_factories_item_factory_class_init (ShelfFactoriesItemFactoryClass * klass) {
#line 25 "/home/gwen/Programmation/vala/vala-sandbox/lib/Factories/ItemFactory.vala"
	shelf_factories_item_factory_parent_class = g_type_class_peek_parent (klass);
#line 77 "ItemFactory.c"
}


static void shelf_factories_item_factory_instance_init (ShelfFactoriesItemFactory * self) {
}


/**
 * An item factory.  Creates {@link Items.DockItem}s based on .dockitem files.
 */
GType shelf_factories_item_factory_get_type (void) {
	static volatile gsize shelf_factories_item_factory_type_id__volatile = 0;
	if (g_once_init_enter (&shelf_factories_item_factory_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (ShelfFactoriesItemFactoryClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) shelf_factories_item_factory_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (ShelfFactoriesItemFactory), 0, (GInstanceInitFunc) shelf_factories_item_factory_instance_init, NULL };
		GType shelf_factories_item_factory_type_id;
		shelf_factories_item_factory_type_id = g_type_register_static (G_TYPE_OBJECT, "ShelfFactoriesItemFactory", &g_define_type_info, 0);
		g_once_init_leave (&shelf_factories_item_factory_type_id__volatile, shelf_factories_item_factory_type_id);
	}
	return shelf_factories_item_factory_type_id__volatile;
}


