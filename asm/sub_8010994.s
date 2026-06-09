	.syntax unified
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.section .text.sub_8010994, "ax", %progbits
@ sub_8010994 @ JP 0x08010994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010994
	.thumb_func
sub_8010994:
	push {lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _080109A8
	cmp r1, #1
	beq _080109C0
	b _080109E4
_080109A8:
	ldr r2, _080109B8 @ =0x030004E0
	ldr r1, _080109BC @ =0x0202BCAC
	ldrh r0, [r1, #0x14]
	strh r0, [r2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #2]
	b _080109E4
	.align 2, 0
_080109B8: .4byte 0x030004E0
_080109BC: .4byte 0x0202BCAC
_080109C0:
	ldrh r0, [r2, #2]
	ldrb r2, [r2, #2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	cmp r2, #0
	blt _080109D4
	cmp r1, #0
	bge _080109DE
_080109D4:
	ldr r0, _080109EC @ =0x030004DC
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #2
	ldrsb r1, [r0, r1]
_080109DE:
	adds r0, r2, #0
	bl SetCursorMapPosition
_080109E4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080109EC: .4byte 0x030004DC

