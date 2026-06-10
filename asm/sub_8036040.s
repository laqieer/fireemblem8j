	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set ShowUnitSprite, 0x080280C4 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_8036040, "ax", %progbits
@ sub_8036040 @ JP 0x08036040 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036040
	.thumb_func
sub_8036040:
	push {lr}
	bl sub_807B4B8
	ldr r0, _08036064 @ =0x0203A4E8
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803605E
	ldr r0, _08036068 @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl ShowUnitSprite
_0803605E:
	pop {r0}
	bx r0
	.align 2, 0
_08036064: .4byte 0x0203A4E8
_08036068: .4byte 0x0203A954

