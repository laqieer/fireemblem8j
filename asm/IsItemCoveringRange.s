	.syntax unified
	.section .text.IsItemCoveringRange, "ax", %progbits
@ IsItemCoveringRange @ JP 0x08016934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemCoveringRange
	.thumb_func
IsItemCoveringRange:
	push {lr}
	adds r3, r1, #0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801695C @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	lsrs r1, r0, #4
	movs r2, #0xf
	ands r2, r0
	cmp r1, r3
	bgt _08016960
	cmp r3, r2
	bgt _08016960
	movs r0, #1
	b _08016962
	.align 2, 0
_0801695C: .4byte 0x0885E068
_08016960:
	movs r0, #0
_08016962:
	pop {r1}
	bx r1
	.align 2, 0

