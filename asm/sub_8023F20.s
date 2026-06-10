	.syntax unified
	.set sub_8023EAC, 0x08023EAC + 1
	.set sub_8031568, 0x08031568 + 1
	.section .text.sub_8023F20, "ax", %progbits
@ sub_8023F20 @ JP 0x08023F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023F20
	.thumb_func
sub_8023F20:
	push {lr}
	bl sub_8031568
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023F68
	ldr r1, _08023F48 @ =0x03004DF0
	ldr r0, [r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08023F68
	ldr r0, _08023F4C @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08023F44
	cmp r0, #3
	beq _08023F50
_08023F44:
	movs r2, #1
	b _08023F52
	.align 2, 0
_08023F48: .4byte 0x03004DF0
_08023F4C: .4byte 0x0202BCEC
_08023F50:
	movs r2, #0xf
_08023F52:
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r2
	beq _08023F6C
	adds r0, r2, #0
	bl sub_8023EAC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023F6C
_08023F68:
	movs r0, #3
	b _08023F6E
_08023F6C:
	movs r0, #1
_08023F6E:
	pop {r1}
	bx r1
	.align 2, 0

