	.syntax unified
	.set StartBgmExt, 0x08002434 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.set sub_80CA388, 0x080CA388 + 1
	.section .text.sub_80CB31C, "ax", %progbits
@ sub_80CB31C @ JP 0x080CB31C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB31C
	.thumb_func
sub_80CB31C:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80B2874
	bl sub_80CA388
	ldr r1, _080CB368 @ =0x020228A8
	movs r5, #0
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	adds r4, #0x29
	strb r5, [r4]
	ldr r2, _080CB36C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x43
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB368: .4byte 0x020228A8
_080CB36C: .4byte 0x03003020

