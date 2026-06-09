	.syntax unified
	.section .text.sub_8001508, "ax", %progbits
@ sub_8001508 @ JP 0x08001508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001508
	.thumb_func
sub_8001508:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r3, r1, #2
	ldr r0, [r1]
	movs r6, #0
	ldrsb r6, [r1, r6]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _08001564
	lsls r0, r6, #0x18
	mov ip, r0
_08001530:
	adds r0, r1, #0
	mov r2, r8
	lsls r0, r2
	mov r4, sb
	adds r2, r4, r0
	subs r4, r1, #1
	cmp r6, #0
	blt _0800155C
	movs r0, #0xff
	lsls r0, r0, #0x18
	mov r5, ip
	adds r1, r5, r0
	adds r5, r0, #0
_0800154A:
	ldrb r0, [r3]
	adds r0, r7, r0
	strb r0, [r2]
	adds r3, #1
	adds r2, #1
	adds r0, r1, #0
	adds r1, r1, r5
	cmp r0, #0
	bge _0800154A
_0800155C:
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bge _08001530
_08001564:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

