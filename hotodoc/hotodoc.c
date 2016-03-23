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

#include "hotodoc.h"

G_DEFINE_TYPE (HotodocFoo, hotodoc_foo, G_TYPE_OBJECT);

static void
hotodoc_foo_class_init(HotodocFooClass *klass)
{
}

static void
hotodoc_foo_init(HotodocFoo *self)
{
}

/**
 * hotodoc_foo_do_foo:
 * @self: instance
 *
 * Returns: a random int
 */
int hotodoc_foo_do_foo(HotodocFoo *self) {
  return 42;
}
