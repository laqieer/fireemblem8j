	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80922DC, 0x080922DC + 1
	.section .text.sub_80A3274, "ax", %progbits
@ sub_80A3274 @ JP 0x080A3274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3274
	.thumb_func
sub_80A3274:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80922DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A328A
	adds r0, r4, #0
	bl sub_8002DE4
	b _080A32B2
_080A328A:
	ldr r0, _080A32B8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080A32B2
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _080A32BC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A32B2
	movs r0, #0x6b
	bl m4aSongNumStart
_080A32B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A32B8: .4byte 0x085775CC
_080A32BC: .4byte 0x0202BCEC

