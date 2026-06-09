	.syntax unified
	.set AnimDisplay, 0x08004F3C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807571C, "ax", %progbits
@ sub_807571C @ JP 0x0807571C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807571C
	.thumb_func
sub_807571C:
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _08075778 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _0807577C @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08075770
	adds r0, r4, #0
	bl sub_8002DE4
_08075770:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075778: .4byte 0xFFFFF7FF
_0807577C: .4byte 0x0000F3FF

