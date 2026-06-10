	.syntax unified
	.section .text.sub_8014818, "ax", %progbits
@ sub_8014818 @ JP 0x08014818 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014818
	.thumb_func
sub_8014818:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r4, r3, #2
	movs r1, #0xff
	ldr r0, [r3]
	ldrb r3, [r3]
	mov ip, r3
	lsrs r0, r0, #8
	ands r0, r1
	cmp r0, #0
	blt _0801488E
	mov r1, ip
	lsls r1, r1, #0x10
	mov sb, r1
_0801484A:
	mov r5, sl
	adds r3, r5, r0
	subs r6, r0, #1
	cmp r3, #0x1f
	bhi _08014886
	lsls r0, r3, #5
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r2, r1, r0
	mov r3, ip
	cmp r3, #0
	blt _08014886
	ldr r0, _080148A0 @ =0xFFFF0000
	mov r5, sb
	adds r1, r5, r0
	adds r5, r0, #0
_0801486C:
	adds r0, r7, r3
	cmp r0, #0x1f
	bhi _08014878
	ldrh r0, [r4]
	add r0, r8
	strh r0, [r2]
_08014878:
	adds r0, r1, #0
	adds r1, r1, r5
	asrs r3, r0, #0x10
	adds r4, #2
	adds r2, #2
	cmp r3, #0
	bge _0801486C
_08014886:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0801484A
_0801488E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080148A0: .4byte 0xFFFF0000

