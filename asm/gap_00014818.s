	.syntax unified
@ Residual Thumb function at ROM 0x08014818 (140 bytes), formerly kept as raw
@ data/residual/gap_00014818.bin INCBIN. Self-contained leaf-ish routine (nested
@ loops copying/offsetting halfword data); no external calls. The single literal
@ pool word is the bitmask CONSTANT 0xFFFF0000 (.4byte, not a pointer). Internal
@ branch targets use local labels; no symbolic references point into this gap.
	.section .text.gap_00014818, "ax", %progbits
	.thumb
	.align 2
	.global gap_00014818
	.thumb_func
gap_00014818:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp, #0]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #36]
	lsls r0, r0, #16
	lsrs r0, r0, #16
	mov r8, r0
	adds r4, r3, #2
	movs r1, #255
	ldr r0, [r3, #0]
	ldrb r3, [r3, #0]
	mov ip, r3
	lsrs r0, r0, #8
	ands r0, r1
	cmp r0, #0
	blt _0801488E
	mov r1, ip
	lsls r1, r1, #16
	mov r9, r1
_0801484A:
	mov r5, sl
	adds r3, r5, r0
	subs r6, r0, #1
	cmp r3, #31
	bhi _08014886
	lsls r0, r3, #5
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r1, [sp, #0]
	adds r2, r1, r0
	mov r3, ip
	cmp r3, #0
	blt _08014886
	ldr r0, [pc, #56]
	mov r5, r9
	adds r1, r5, r0
	adds r5, r0, #0
_0801486C:
	adds r0, r7, r3
	cmp r0, #31
	bhi _08014878
	ldrh r0, [r4, #0]
	add r0, r8
	strh r0, [r2, #0]
_08014878:
	adds r0, r1, #0
	adds r1, r1, r5
	asrs r3, r0, #16
	adds r4, #2
	adds r2, #2
	cmp r3, #0
	bge _0801486C
_08014886:
	lsls r0, r6, #16
	asrs r0, r0, #16
	cmp r0, #0
	bge _0801484A
_0801488E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.2byte 0
	.4byte 0xFFFF0000
