	.syntax unified
	.set sub_8003520, 0x08003520 + 1
	.section .text.sub_803660C, "ax", %progbits
@ sub_803660C @ JP 0x0803660C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803660C
	.thumb_func
sub_803660C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	movs r1, #3
	bl sub_8003520
	movs r1, #1
	ldr r0, _0803668C @ =0x020228A8
	mov sb, r0
	movs r2, #0x1f
	mov ip, r2
	ldr r0, _08036690 @ =0x0200300C
	mov r8, r0
_0803662A:
	adds r0, r1, #0
	adds r0, #0x30
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	adds r4, r0, #0
	mov r2, ip
	ands r4, r2
	asrs r3, r0, #5
	ands r3, r2
	asrs r2, r0, #0xa
	mov r0, ip
	ands r2, r0
	lsls r0, r1, #1
	adds r7, r1, #1
	mov r1, r8
	adds r5, r0, r1
	movs r6, #7
_0803664E:
	lsls r0, r2, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r4
	strh r0, [r5]
	adds r4, #3
	cmp r4, #0x1f
	ble _08036660
	movs r4, #0x1f
_08036660:
	adds r3, #3
	cmp r3, #0x1f
	ble _08036668
	movs r3, #0x1f
_08036668:
	adds r2, #3
	cmp r2, #0x1f
	ble _08036670
	movs r2, #0x1f
_08036670:
	adds r5, #0x20
	subs r6, #1
	cmp r6, #0
	bge _0803664E
	adds r1, r7, #0
	cmp r1, #0xf
	ble _0803662A
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803668C: .4byte 0x020228A8
_08036690: .4byte 0x0200300C

