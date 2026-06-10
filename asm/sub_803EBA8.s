	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_803EBA8, "ax", %progbits
@ sub_803EBA8 @ JP 0x0803EBA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803EBA8
	.thumb_func
sub_803EBA8:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x4b
	blt _0803EBDC
	cmp r0, #0x4f
	ble _0803EBC0
	cmp r0, #0x57
	beq _0803EBD0
	b _0803EBDC
_0803EBC0:
	ldr r0, _0803EBCC @ =0x03004DF0
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #4
	b _0803EBD8
	.align 2, 0
_0803EBCC: .4byte 0x03004DF0
_0803EBD0:
	ldr r0, _0803EBE0 @ =0x03004DF0
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #0x10
_0803EBD8:
	orrs r0, r1
	strb r0, [r2, #0xa]
_0803EBDC:
	pop {r0}
	bx r0
	.align 2, 0
_0803EBE0: .4byte 0x03004DF0

