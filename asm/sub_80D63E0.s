	.syntax unified
	.section .text.sub_80D63E0, "ax", %progbits
@ ReadSramFast_Core @ JP 0x080D63E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ReadSramFast_Core
	.thumb_func
ReadSramFast_Core:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D6418 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080D641C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D6410
	adds r1, r0, #0
_080D6402:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080D6402
_080D6410:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6418: .4byte 0x04000204
_080D641C: .4byte 0x0000FFFC

