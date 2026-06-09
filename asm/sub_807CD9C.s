	.syntax unified
	.set sub_807B9B0, 0x0807B9B0 + 1
	.section .text.sub_807CD9C, "ax", %progbits
@ sub_807CD9C @ JP 0x0807CD9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CD9C
	.thumb_func
sub_807CD9C:
	push {lr}
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0807CDE4 @ =0x0203E1EC
	adds r2, r0, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	adds r1, r0, #0
	cmp r2, #1
	beq _0807CDBE
	cmp r2, #2
	bne _0807CDC6
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807CDBE
	movs r3, #1
_0807CDBE:
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0807CDC6
	movs r3, #0
_0807CDC6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _0807CDDE
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_807B9B0
_0807CDDE:
	pop {r0}
	bx r0
	.align 2, 0
_0807CDE4: .4byte 0x0203E1EC

