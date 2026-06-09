	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_80C0414, "ax", %progbits
@ sub_80C0414 @ JP 0x080C0414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0414
	.thumb_func
sub_80C0414:
	push {r4, lr}
	lsls r0, r0, #5
	ldr r1, _080C0444 @ =0x081F5D7C
	adds r4, r0, r1
	movs r1, #6
	ldrsh r0, [r4, r1]
	bl CheckFlag
	lsls r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #8
	cmp r0, #0
	beq _080C0430
	adds r1, #2
_080C0430:
	ldr r0, _080C0448 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080C043C
	cmp r0, #3
	beq _080C044C
_080C043C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _080C0450
	.align 2, 0
_080C0444: .4byte 0x081F5D7C
_080C0448: .4byte 0x0202BCEC
_080C044C:
	movs r0, #1
	ldrsb r0, [r1, r0]
_080C0450:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

