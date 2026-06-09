	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_80D4178, "ax", %progbits
@ sub_80D4178 @ JP 0x080D4178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D4178
	.thumb_func
sub_80D4178:
	push {r4, lr}
	ldr r4, _080D4180 @ =0x08BB2E60
	b _080D41A2
	.align 2, 0
_080D4180: .4byte 0x08BB2E60
_080D4184:
	ldrh r0, [r4, #6]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D41A0
	ldrh r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D41A0
	movs r0, #0
	b _080D41AA
_080D41A0:
	adds r4, #0xc
_080D41A2:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080D4184
	movs r0, #1
_080D41AA:
	pop {r4}
	pop {r1}
	bx r1

