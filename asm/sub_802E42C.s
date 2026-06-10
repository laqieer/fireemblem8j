	.syntax unified
	.set GetChapterMapChangesPointer, 0x0803458C + 1
	.section .text.sub_802E42C, "ax", %progbits
@ sub_802E42C @ JP 0x0802E42C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E42C
	.thumb_func
sub_802E42C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E444 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChangesPointer
	adds r1, r0, #0
	cmp r1, #0
	bne _0802E456
	b _0802E45E
	.align 2, 0
_0802E444: .4byte 0x0202BCEC
_0802E448:
	adds r0, r1, #0
	b _0802E460
_0802E44C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	beq _0802E448
	adds r1, #0xc
_0802E456:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802E44C
_0802E45E:
	movs r0, #0
_0802E460:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

