	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_80D2C48, "ax", %progbits
@ sub_80D2C48 @ JP 0x080D2C48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2C48
	.thumb_func
sub_80D2C48:
	push {r4, lr}
	ldr r4, _080D2C58 @ =0x08BB2E60
_080D2C4C:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080D2C5C
	movs r0, #1
	b _080D2C6E
	.align 2, 0
_080D2C58: .4byte 0x08BB2E60
_080D2C5C:
	ldrh r0, [r4, #6]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D2C6C
	adds r4, #0xc
	b _080D2C4C
_080D2C6C:
	movs r0, #0
_080D2C6E:
	pop {r4}
	pop {r1}
	bx r1

