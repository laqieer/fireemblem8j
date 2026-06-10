	.syntax unified
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8039D24, "ax", %progbits
@ sub_8039D24 @ JP 0x08039D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039D24
	.thumb_func
sub_8039D24:
	push {r4, r5, lr}
	ldr r2, _08039D7C @ =0x085D1EA4
	ldr r0, _08039D80 @ =0x0203AA00
	adds r1, r0, #0
	adds r1, #0x79
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08039D74
	ldr r0, _08039D84 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08039D74
	adds r5, r2, #0
	adds r4, r1, #0
_08039D4A:
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_80D65BC
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08039D74
	ldr r0, _08039D84 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08039D4A
_08039D74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039D7C: .4byte 0x085D1EA4
_08039D80: .4byte 0x0203AA00
_08039D84: .4byte 0x0203AA90

