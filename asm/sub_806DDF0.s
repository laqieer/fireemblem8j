	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806DDF0, "ax", %progbits
@ sub_806DDF0 @ JP 0x0806DDF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DDF0
	.thumb_func
sub_806DDF0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r5, _0806DE14 @ =0x020228A8
	ldr r4, _0806DE18 @ =0x020165C8
	ldrh r0, [r5]
	strh r0, [r4]
	movs r6, #0
_0806DE02:
	subs r0, r6, #2
	cmp r0, #0x1c
	bhi _0806DEAA
	lsls r0, r0, #2
	ldr r1, _0806DE1C @ =_0806DE20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DE14: .4byte 0x020228A8
_0806DE18: .4byte 0x020165C8
_0806DE1C: .4byte _0806DE20
_0806DE20: @ jump table
	.4byte _0806DE94 @ case 0
	.4byte _0806DE94 @ case 1
	.4byte _0806DEAA @ case 2
	.4byte _0806DEAA @ case 3
	.4byte _0806DEAA @ case 4
	.4byte _0806DEAA @ case 5
	.4byte _0806DEAA @ case 6
	.4byte _0806DEAA @ case 7
	.4byte _0806DEAA @ case 8
	.4byte _0806DEAA @ case 9
	.4byte _0806DEAA @ case 10
	.4byte _0806DEAA @ case 11
	.4byte _0806DEAA @ case 12
	.4byte _0806DEAA @ case 13
	.4byte _0806DE94 @ case 14
	.4byte _0806DEAA @ case 15
	.4byte _0806DE94 @ case 16
	.4byte _0806DEAA @ case 17
	.4byte _0806DEAA @ case 18
	.4byte _0806DE94 @ case 19
	.4byte _0806DE94 @ case 20
	.4byte _0806DEAA @ case 21
	.4byte _0806DEAA @ case 22
	.4byte _0806DEAA @ case 23
	.4byte _0806DEAA @ case 24
	.4byte _0806DE94 @ case 25
	.4byte _0806DE94 @ case 26
	.4byte _0806DE94 @ case 27
	.4byte _0806DE94 @ case 28
_0806DE94:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r5, #0x20
	adds r4, #0x20
	adds r1, r6, #1
	mov r7, r8
	adds r7, #0x4c
	b _0806DEC4
_0806DEAA:
	adds r5, #2
	adds r4, #2
	adds r1, r6, #1
	mov r7, r8
	adds r7, #0x4c
	movs r2, #0
	movs r0, #0xe
_0806DEB8:
	strh r2, [r4]
	adds r5, #2
	adds r4, #2
	subs r0, #1
	cmp r0, #0
	bge _0806DEB8
_0806DEC4:
	adds r6, r1, #0
	cmp r6, #0x1f
	ble _0806DE02
	ldr r0, _0806DEFC @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	bl sub_8001EF0
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x10
	bne _0806DEEA
	mov r0, r8
	bl sub_8002DE4
_0806DEEA:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEFC: .4byte 0x020165C8

