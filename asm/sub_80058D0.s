	.syntax unified
	.set GetGenericChibiImg, 0x08005E70 + 1
	.set GetPortraitData, 0x0800541C + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8005EA0, 0x08005EA0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80058D0, "ax", %progbits
@ sub_80058D0 @ JP 0x080058D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80058D0
	.thumb_func
sub_80058D0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08005960 @ =0xFFFFFE00
	add sp, r4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, _08005964 @ =0x00007EFF
	cmp r6, r0
	ble _0800596C
	adds r0, r6, #0
	bl GetGenericChibiImg
	lsls r1, r7, #5
	ldr r5, _08005968 @ =0x0001FFFF
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetGenericChibiImg
	adds r0, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetGenericChibiImg
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #4
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetGenericChibiImg
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	mov r1, r8
	adds r1, #0x10
	adds r0, r6, #0
	bl sub_8005EA0
	b _080059C8
	.align 2, 0
_08005960: .4byte 0xFFFFFE00
_08005964: .4byte 0x00007EFF
_08005968: .4byte 0x0001FFFF
_0800596C:
	adds r0, r6, #0
	bl GetPortraitData
	adds r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, sp
	bl sub_8013008
	lsls r1, r7, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	mov r0, sp
	movs r2, #0x20
	bl sub_80D636C
	add r0, sp, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl sub_80D636C
	add r0, sp, #0x100
	adds r1, r7, #4
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl sub_80D636C
	add r0, sp, #0x180
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl sub_80D636C
	ldr r0, [r5, #8]
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
_080059C8:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

