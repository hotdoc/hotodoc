/* hotodoc
 * Copyright (C) 2016 Mathieu Duponchelle <mathieu.duponchelle@opencreed.com>
 *               2016 Collabora
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#ifndef __HOTODOC_H__
#define __HOTODOC_H__

#include <glib-object.h>

G_BEGIN_DECLS

typedef struct _HotodocFoo HotodocFoo;
typedef struct _HotodocFooClass HotodocFooClass;

#define HOTODOC_TYPE_FOO                (hotodoc_foo_get_type ())
#define HOTODOC_IS_FOO(obj)             (G_TYPE_CHECK_INSTANCE_TYPE ((obj), HOTODOC_TYPE_FOO))
#define HOTODOC_IS_FOO_CLASS(klass)     (G_TYPE_CHECK_CLASS_TYPE ((klass), HOTODOC_TYPE_FOO))
#define HOTODOC_FOO_GET_CLASS(obj)      (G_TYPE_INSTANCE_GET_CLASS ((obj), HOTODOC_TYPE_FOO, HotodocFooClass))
#define HOTODOC_FOO(obj)                (G_TYPE_CHECK_INSTANCE_CAST ((obj), HOTODOC_TYPE_FOO, HotodocFoo))
#define HOTODOC_FOO_CLASS(klass)        (G_TYPE_CHECK_CLASS_CAST ((klass), HOTODOC_TYPE_FOO, HotodocFooClass))
#define HOTODOC_FOO_CAST(obj)           ((HotodocFoo*)(obj))

GType hotodoc_foo_get_type(void);

/**
 * HotodocFoo:
 *
 * The HotodocFoo instance.
 */
struct _HotodocFoo {
  GObject	object;
};

/**
 * HotodocFooClass:
 *
 * The HotodocFooClass class.
 */
struct _HotodocFooClass {
  GObjectClass parent_class;
};

G_END_DECLS

#endif
