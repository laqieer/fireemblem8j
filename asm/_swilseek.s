	.syntax unified
	.set findslot, 0x080DA3C8 + 1
	.set remap_handle, 0x080DA3E8 + 1
	.section .text._swilseek, "ax", %progbits
@ _swilseek @ JP 0x080DA550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _swilseek
	.thumb_func
_swilseek:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	bl remap_handle
	adds r7, r0, #0
	bl findslot
	adds r6, r0, #0
	cmp r4, #1
	bne _080DA586
	cmp r6, #0x14
	bne _080DA578
	movs r0, #1
	rsbs r0, r0, #0
	b _080DA5C8
_080DA578:
	ldr r0, _080DA5D0 @ =0x03002B40
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r5, r0
	movs r4, #0
_080DA586:
	cmp r4, #2
	bne _080DA598
	str r7, [sp]
	movs r3, #0xc
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r5, r5, r2
_080DA598:
	mov r0, r8
	bl remap_handle
	str r0, [sp]
	str r5, [sp, #4]
	movs r3, #0xa
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	cmp r6, #0x14
	beq _080DA5BE
	cmp r2, #0
	bne _080DA5BE
	ldr r0, _080DA5D0 @ =0x03002B40
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_080DA5BE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, #0
	bne _080DA5C8
	adds r0, r5, #0
_080DA5C8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DA5D0: .4byte 0x03002B40

