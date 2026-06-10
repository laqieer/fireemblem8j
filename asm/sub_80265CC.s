	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80265CC, "ax", %progbits
@ sub_80265CC @ JP 0x080265CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80265CC
	.thumb_func
sub_80265CC:
	push {lr}
	ldr r0, _080265F4 @ =0x085C7340
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	ldr r0, _080265F8 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08026600
	ldr r0, _080265FC @ =0x085C73C0
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	b _0802660C
	.align 2, 0
_080265F4: .4byte 0x085C7340
_080265F8: .4byte 0x0202BCAC
_080265FC: .4byte 0x085C73C0
_08026600:
	ldr r0, _08026610 @ =0x085C73E0
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
_0802660C:
	pop {r0}
	bx r0
	.align 2, 0
_08026610: .4byte 0x085C73E0

