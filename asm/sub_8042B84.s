	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042720, 0x08042720 + 1
	.section .text.sub_8042B84, "ax", %progbits
@ sub_8042B84 @ JP 0x08042B84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042B84
	.thumb_func
sub_8042B84:
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042BC0
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08042BC0:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

