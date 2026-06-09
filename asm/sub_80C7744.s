	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set sub_80C7264, 0x080C7264 + 1
	.set sub_80C7560, 0x080C7560 + 1
	.section .text.sub_80C7744, "ax", %progbits
@ sub_80C7744 @ JP 0x080C7744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7744
	.thumb_func
sub_80C7744:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl sub_80C7264
	ldr r6, _080C77AC @ =0x081F67BC
	adds r7, r4, #0
	adds r7, #0x2a
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r2, sp
	ldrh r1, [r0, #8]
	ldrh r2, [r2]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r0, #0xa]
	ldrh r0, [r5]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, [r4, #0x2c]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r3, r5, #0
	orrs r2, r3
	bl AP_Update
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r2, #8
	ldrsh r1, [r0, r2]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	adds r0, r4, #0
	movs r3, #0
	bl sub_80C7560
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C77AC: .4byte 0x081F67BC

