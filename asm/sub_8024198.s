	.syntax unified
	.set sub_8025BA4, 0x08025BA4 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8024198, "ax", %progbits
@ sub_8024198 @ JP 0x08024198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024198
	.thumb_func
sub_8024198:
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _080241C4
	bl sub_804F610
	ldr r0, _080241BC @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025BA4
	ldr r0, _080241C0 @ =0x085C57F8
	bl sub_80507B0
	movs r0, #7
	b _080241D0
	.align 2, 0
_080241BC: .4byte 0x03004DF0
_080241C0: .4byte 0x085C57F8
_080241C4:
	movs r1, #0xfc
	lsls r1, r1, #3
	adds r0, r2, #0
	bl sub_80502F4
	movs r0, #8
_080241D0:
	pop {r1}
	bx r1

