	.syntax unified
	.set sub_80032E0, 0x080032E0 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8002D78, "ax", %progbits
@ sub_8002D78 @ JP 0x08002D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002D78
	.thumb_func
sub_8002D78:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08002D86
	bl sub_8002D78
_08002D86:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08002DC4
	adds r2, r4, #0
	adds r2, #0x27
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _08002DC4
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _08002DB2
	adds r0, r4, #0
	bl sub_80032E0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08002DBA
_08002DB2:
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	bl sub_80D65C0
_08002DBA:
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08002DCE
_08002DC4:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08002DCE
	bl sub_8002D78
_08002DCE:
	pop {r4, r5}
	pop {r0}
	bx r0

