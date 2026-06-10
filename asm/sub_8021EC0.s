	.syntax unified
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8021EC0, "ax", %progbits
@ sub_8021EC0 @ JP 0x08021EC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021EC0
	.thumb_func
sub_8021EC0:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl sub_8012E84
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	str r4, [sp]
	movs r0, #0
	mov r2, sb
	adds r3, r6, #0
	bl sub_8012E84
	mov r1, r8
	str r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

