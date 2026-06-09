	.syntax unified
	.set GMapScreenVSync_AddCopyRequest, 0x080BF578 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_80BF6B4, "ax", %progbits
@ sub_80BF6B4 @ JP 0x080BF6B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF6B4
	.thumb_func
sub_80BF6B4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	mov r8, r1
	adds r6, r2, #0
	mov r0, r8
	movs r1, #0x3c
	bl __modsi3
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #0x28
	bl __modsi3
	mov sb, r0
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0x20
	ble _080BF714
	movs r5, #0x20
	subs r4, r5, r7
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	mov r0, sl
	adds r1, r7, #0
	mov r2, sb
	mov r3, r8
	bl GMapScreenVSync_AddCopyRequest
	adds r1, r7, r4
	mov r0, r8
	adds r3, r0, r4
	str r6, [sp]
	subs r5, r5, r4
	str r5, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	mov r0, sl
	mov r2, sb
	bl GMapScreenVSync_AddCopyRequest
	b _080BF72A
_080BF714:
	str r6, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	mov r0, sl
	adds r1, r7, #0
	mov r2, sb
	mov r3, r8
	bl GMapScreenVSync_AddCopyRequest
_080BF72A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

