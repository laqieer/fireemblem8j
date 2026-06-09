	.syntax unified
	.section .text.sub_80012FC, "ax", %progbits
@ sub_80012FC @ JP 0x080012FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80012FC
	.thumb_func
sub_80012FC:
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	ldrh r1, [r2, #4]
	strh r1, [r2, #0xa]
	strh r5, [r2, #4]
	adds r0, r5, #0
	bics r0, r1
	strh r0, [r2, #6]
	ldr r3, _08001360 @ =0x0000FFFF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2, #8]
	cmp r0, #0
	beq _0800131E
	strh r5, [r2, #0xc]
_0800131E:
	movs r0, #0
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #4]
	adds r3, r0, #0
	cmp r3, #0
	bne _08001342
	ldrh r4, [r2, #0xc]
	cmp r4, #0
	beq _0800133C
	ldrh r1, [r2, #0xa]
	ldr r0, _08001364 @ =0x00000303
	ands r0, r1
	cmp r4, r0
	bne _0800133C
	strh r1, [r2, #0xe]
_0800133C:
	lsls r0, r3, #0x10
	cmp r0, #0
	beq _08001368
_08001342:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r2, #0xa]
	cmp r0, r1
	bne _08001368
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800136C
	strh r3, [r2, #6]
	ldrb r0, [r2, #1]
	b _0800136A
	.align 2, 0
_08001360: .4byte 0x0000FFFF
_08001364: .4byte 0x00000303
_08001368:
	ldrb r0, [r2]
_0800136A:
	strb r0, [r2, #2]
_0800136C:
	ldrh r0, [r2, #0x10]
	eors r0, r3
	ands r0, r3
	strh r0, [r2, #0x10]
	ldr r0, _08001380 @ =0x000003F3
	ands r0, r5
	cmp r0, #0
	beq _08001384
	movs r0, #0
	b _0800138E
	.align 2, 0
_08001380: .4byte 0x000003F3
_08001384:
	ldrh r1, [r2, #0x12]
	ldr r0, _08001398 @ =0x0000FFFE
	cmp r1, r0
	bhi _08001390
	adds r0, r1, #1
_0800138E:
	strh r0, [r2, #0x12]
_08001390:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001398: .4byte 0x0000FFFE

