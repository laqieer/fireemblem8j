	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_8008938, "ax", %progbits
@ sub_8008938 @ JP 0x08008938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008938
	.thumb_func
sub_8008938:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov sb, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b _0800895E
_08008954:
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_80040B8
	adds r4, r0, #0
_0800895E:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08008984
	cmp r0, #1
	bne _0800897E
	ldm r7!, {r0}
	adds r1, r5, #0
	bl PutText
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, sb
	bge _08008994
_0800897E:
	mov r2, r8
	cmp r2, #0
	beq _08008954
_08008984:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl PutText
_08008994:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

