	.syntax unified
	.set ArenaIsUnitAllowed, 0x08031E9C + 1
	.section .text.sub_80240A8, "ax", %progbits
@ sub_80240A8 @ JP 0x080240A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80240A8
	.thumb_func
sub_80240A8:
	push {lr}
	ldr r0, _080240E0 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _080240DA
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080240DA
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _080240E4 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq _080240E8
_080240DA:
	movs r0, #3
	b _080240FA
	.align 2, 0
_080240E0: .4byte 0x03004DF0
_080240E4: .4byte 0x0202E4D8
_080240E8:
	adds r0, r2, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080240F8
	movs r1, #1
_080240F8:
	adds r0, r1, #0
_080240FA:
	pop {r1}
	bx r1
	.align 2, 0

