	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.section .text.sub_80130AC, "ax", %progbits
@ sub_80130AC @ JP 0x080130AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80130AC
	.thumb_func
sub_80130AC:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _080130D2
	adds r4, r3, #0
_080130BA:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl RegisterDataMove
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080130BA
_080130D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

