	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_8089088, 0x08089088 + 1
	.section .text.sub_801DBC0, "ax", %progbits
@ sub_801DBC0 @ JP 0x0801DBC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DBC0
	.thumb_func
sub_801DBC0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_8089088
	bl GetUnit
	cmp r0, #0
	beq _0801DBEA
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8015E18
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetCursorMapPosition
_0801DBEA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

