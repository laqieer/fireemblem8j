	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025544, 0x08025544 + 1
	.section .text.sub_80229BC, "ax", %progbits
@ sub_80229BC @ JP 0x080229BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80229BC
	.thumb_func
sub_80229BC:
	push {lr}
	ldr r0, _080229F4 @ =0x03004DF0
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080229FC
	ldr r0, _080229F8 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080229FC
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _080229FC
	adds r0, r3, #0
	bl sub_8025544
	bl GetSelectTargetCount
	cmp r0, #0
	beq _080229FC
	movs r0, #1
	b _080229FE
	.align 2, 0
_080229F4: .4byte 0x03004DF0
_080229F8: .4byte 0x0202BCAC
_080229FC:
	movs r0, #3
_080229FE:
	pop {r1}
	bx r1
	.align 2, 0

