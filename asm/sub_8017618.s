	.syntax unified
	.set sub_8033168, 0x08033168 + 1
	.section .text.sub_8017618, "ax", %progbits
@ sub_8017618 @ JP 0x08017618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8017618
	.thumb_func
sub_8017618:
	push {r4, r5, lr}
	movs r5, #0x40
	ldrb r4, [r0]
	bl sub_8033168
	movs r2, #1
	ldr r4, _0801763C @ =0x085C2A50
	movs r3, #0xff
_08017628:
	adds r0, r2, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017640
	adds r0, r1, #0
	b _08017648
	.align 2, 0
_0801763C: .4byte 0x085C2A50
_08017640:
	adds r2, #1
	cmp r2, r5
	blt _08017628
	movs r0, #0
_08017648:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

