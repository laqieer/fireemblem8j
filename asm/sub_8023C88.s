	.syntax unified
	.set sub_80255C0, 0x080255C0 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8023C88, "ax", %progbits
@ TalkCommandEffect @ JP 0x08023C88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TalkCommandEffect
	.thumb_func
TalkCommandEffect:
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023CB0
	ldr r0, _08023CA8 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_80255C0
	ldr r0, _08023CAC @ =0x085C5878
	bl sub_80507B0
	movs r0, #7
	b _08023CBC
	.align 2, 0
_08023CA8: .4byte 0x03004DF0
_08023CAC: .4byte 0x085C5878
_08023CB0:
	movs r1, #0xfa
	lsls r1, r1, #3
	adds r0, r2, #0
	bl sub_80502F4
	movs r0, #8
_08023CBC:
	pop {r1}
	bx r1

