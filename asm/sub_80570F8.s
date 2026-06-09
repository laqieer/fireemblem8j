	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.section .text.sub_80570F8, "ax", %progbits
@ sub_80570F8 @ JP 0x080570F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80570F8
	.thumb_func
sub_80570F8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805711C @ =0x0203E0FA
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08057112
	bl GetBanimDragonStatusType
	cmp r0, #1
	blo _08057120
	cmp r0, #2
	bhi _08057120
_08057112:
	adds r0, r4, #0
	bl sub_8002DE4
	b _08057146
	.align 2, 0
_0805711C: .4byte 0x0203E0FA
_08057120:
	ldr r0, _0805714C @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80195E4
	movs r0, #0x10
	bl sub_8073B80
	bl sub_8019914
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r4, #0
	bl sub_8002DE4
_08057146:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805714C: .4byte 0x0202BCEC

