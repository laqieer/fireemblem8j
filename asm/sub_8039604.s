	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80386AC, 0x080386AC + 1
	.section .text.sub_8039604, "ax", %progbits
@ sub_8039604 @ JP 0x08039604 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039604
	.thumb_func
sub_8039604:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	adds r1, r0, #1
	str r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r0, r0, r1
	cmp r0, #0x64
	ble _08039620
	adds r0, r1, #1
	str r0, [r7, #0x30]
_08039620:
	ldr r0, _080396A8 @ =0x080DCD04
	mov r8, r0
	adds r0, #0x28
	ldrb r2, [r0]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r6, _080396AC @ =0x02003A08
	adds r0, r0, r6
	ldrh r1, [r7, #0x30]
	mov r3, r8
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov r4, r8
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_80386AC
	mov r0, r8
	ldrb r2, [r0, #4]
	subs r5, r5, r2
	lsls r5, r5, #3
	ldr r0, _080396B0 @ =0xFFFFFEC0
	adds r6, r6, r0
	adds r5, r5, r6
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x30]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r6, r8
	movs r3, #0
	ldrsb r3, [r6, r3]
	movs r0, #1
	ldrsb r0, [r6, r0]
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl sub_80386AC
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ble _0803968E
	subs r0, #1
	str r0, [r7, #0x3c]
_0803968E:
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	cmp r1, r0
	blt _0803969C
	adds r0, r7, #0
	bl sub_8002DE4
_0803969C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080396A8: .4byte 0x080DCD04
_080396AC: .4byte 0x02003A08
_080396B0: .4byte 0xFFFFFEC0

