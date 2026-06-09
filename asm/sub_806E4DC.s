	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806E4DC, "ax", %progbits
@ sub_806E4DC @ JP 0x0806E4DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E4DC
	.thumb_func
sub_806E4DC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r5, _0806E500 @ =0x020228A8
	ldr r4, _0806E504 @ =0x020165C8
	ldrh r0, [r5]
	strh r0, [r4]
	movs r7, #0
_0806E4EE:
	subs r0, r7, #1
	cmp r0, #0x1d
	bhi _0806E59A
	lsls r0, r0, #2
	ldr r1, _0806E508 @ =_0806E50C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E500: .4byte 0x020228A8
_0806E504: .4byte 0x020165C8
_0806E508: .4byte _0806E50C
_0806E50C: @ jump table
	.4byte _0806E584 @ case 0
	.4byte _0806E584 @ case 1
	.4byte _0806E584 @ case 2
	.4byte _0806E59A @ case 3
	.4byte _0806E59A @ case 4
	.4byte _0806E59A @ case 5
	.4byte _0806E59A @ case 6
	.4byte _0806E59A @ case 7
	.4byte _0806E59A @ case 8
	.4byte _0806E59A @ case 9
	.4byte _0806E59A @ case 10
	.4byte _0806E59A @ case 11
	.4byte _0806E59A @ case 12
	.4byte _0806E59A @ case 13
	.4byte _0806E59A @ case 14
	.4byte _0806E584 @ case 15
	.4byte _0806E59A @ case 16
	.4byte _0806E59A @ case 17
	.4byte _0806E59A @ case 18
	.4byte _0806E59A @ case 19
	.4byte _0806E584 @ case 20
	.4byte _0806E584 @ case 21
	.4byte _0806E59A @ case 22
	.4byte _0806E59A @ case 23
	.4byte _0806E59A @ case 24
	.4byte _0806E59A @ case 25
	.4byte _0806E584 @ case 26
	.4byte _0806E584 @ case 27
	.4byte _0806E584 @ case 28
	.4byte _0806E584 @ case 29
_0806E584:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r5, #0x20
	adds r4, #0x20
	adds r1, r7, #1
	mov r6, r8
	adds r6, #0x4c
	b _0806E5B4
_0806E59A:
	adds r5, #2
	adds r4, #2
	adds r1, r7, #1
	mov r6, r8
	adds r6, #0x4c
	movs r2, #0
	movs r0, #0xe
_0806E5A8:
	strh r2, [r4]
	adds r5, #2
	adds r4, #2
	subs r0, #1
	cmp r0, #0
	bge _0806E5A8
_0806E5B4:
	adds r7, r1, #0
	cmp r7, #0x1f
	ble _0806E4EE
	ldr r0, _0806E5E4 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	bl sub_8001EF0
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x12
	bne _0806E5E8
	movs r0, #0
	strh r0, [r6]
	mov r0, r8
	bl sub_8002DE4
	b _0806E5EC
	.align 2, 0
_0806E5E4: .4byte 0x020165C8
_0806E5E8:
	adds r0, r1, #1
	strh r0, [r6]
_0806E5EC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

