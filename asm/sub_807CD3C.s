	.syntax unified
	.set sub_807DF00, 0x0807DF00 + 1
	.set sub_80858E0, 0x080858E0 + 1
	.set sub_8085914, 0x08085914 + 1
	.section .text.sub_807CD3C, "ax", %progbits
@ MapAnim_DisplayDeathQuote @ JP 0x0807CD3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnim_DisplayDeathQuote
	.thumb_func
MapAnim_DisplayDeathQuote:
	push {r4, lr}
	movs r2, #1
	rsbs r2, r2, #0
	ldr r0, _0807CD98 @ =0x0203E1EC
	adds r1, r0, #0
	adds r1, #0x5e
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _0807CD5E
	cmp r1, #2
	bne _0807CD66
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807CD5E
	movs r2, #1
_0807CD5E:
	ldrb r0, [r3, #0xd]
	cmp r0, #0
	bne _0807CD66
	movs r2, #0
_0807CD66:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0807CD92
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	adds r0, r4, #0
	bl sub_80858E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CD92
	bl sub_807DF00
	adds r0, r4, #0
	bl sub_8085914
_0807CD92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CD98: .4byte 0x0203E1EC

