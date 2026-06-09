	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805441C, "ax", %progbits
@ sub_805441C @ JP 0x0805441C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805441C
	.thumb_func
sub_805441C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805442C @ =0x02017748
	ldr r0, [r0]
	cmp r0, #1
	bne _08054430
	movs r0, #0
	b _0805450C
	.align 2, 0
_0805442C: .4byte 0x02017748
_08054430:
	ldr r1, _0805445C @ =0x0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, _08054460 @ =0x085E3A7C
	movs r1, #3
	bl sub_8002BCC
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, _08054464 @ =0x02000000
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi _080544F8
	lsls r0, r4, #2
	ldr r1, _08054468 @ =_0805446C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805445C: .4byte 0x0201773C
_08054460: .4byte 0x085E3A7C
_08054464: .4byte 0x02000000
_08054468: .4byte _0805446C
_0805446C: @ jump table
	.4byte _08054488 @ case 0
	.4byte _08054498 @ case 1
	.4byte _080544A8 @ case 2
	.4byte _080544B8 @ case 3
	.4byte _080544C8 @ case 4
	.4byte _080544D8 @ case 5
	.4byte _080544E8 @ case 6
_08054488:
	ldr r0, _08054494 @ =0x080DF4A6
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08054502
	.align 2, 0
_08054494: .4byte 0x080DF4A6
_08054498:
	ldr r0, _080544A4 @ =0x080DF4C8
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08054502
	.align 2, 0
_080544A4: .4byte 0x080DF4C8
_080544A8:
	ldr r0, _080544B4 @ =0x080DF512
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08054502
	.align 2, 0
_080544B4: .4byte 0x080DF512
_080544B8:
	ldr r0, _080544C4 @ =0x080DF55C
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08054502
	.align 2, 0
_080544C4: .4byte 0x080DF55C
_080544C8:
	ldr r0, _080544D4 @ =0x080DF5A6
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08054502
	.align 2, 0
_080544D4: .4byte 0x080DF5A6
_080544D8:
	ldr r0, _080544E4 @ =0x080DF5F0
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _08054502
	.align 2, 0
_080544E4: .4byte 0x080DF5F0
_080544E8:
	ldr r0, _080544F4 @ =0x080DF65A
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _08054502
	.align 2, 0
_080544F4: .4byte 0x080DF65A
_080544F8:
	ldr r0, _08054514 @ =0x080DF4A6
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
_08054502:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
_0805450C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08054514: .4byte 0x080DF4A6

