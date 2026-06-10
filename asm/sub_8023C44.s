	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80255C0, 0x080255C0 + 1
	.section .text.sub_8023C44, "ax", %progbits
@ sub_8023C44 @ JP 0x08023C44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023C44
	.thumb_func
sub_8023C44:
	push {r4, lr}
	ldr r4, _08023C68 @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023C62
	adds r0, r2, #0
	bl sub_80255C0
	bl GetSelectTargetCount
	cmp r0, #0
	bne _08023C6C
_08023C62:
	movs r0, #3
	b _08023C80
	.align 2, 0
_08023C68: .4byte 0x03004DF0
_08023C6C:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08023C7E
	movs r0, #1
	b _08023C80
_08023C7E:
	movs r0, #2
_08023C80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

