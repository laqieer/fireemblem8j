	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80A46F8, "ax", %progbits
@ sub_80A46F8 @ JP 0x080A46F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A46F8
	.thumb_func
sub_80A46F8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _080A4730 @ =0x020229EA
	ldr r5, _080A4734 @ =0x0202BCEC
	adds r1, r4, #0
	adds r1, #0x2c
	movs r2, #0xe
_080A4706:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080A4706
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4726
	movs r0, #0xee
	bl m4aSongNumStart
_080A4726:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4730: .4byte 0x020229EA
_080A4734: .4byte 0x0202BCEC

