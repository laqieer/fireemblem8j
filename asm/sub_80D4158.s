	.syntax unified
	.set SetFlag, 0x080860A8 + 1
	.section .text.sub_80D4158, "ax", %progbits
@ sub_80D4158 @ JP 0x080D4158 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D4158
	.thumb_func
sub_80D4158:
	push {r4, lr}
	ldr r4, _080D4160 @ =0x08BB2E60
	b _080D416C
	.align 2, 0
_080D4160: .4byte 0x08BB2E60
_080D4164:
	ldrh r0, [r4, #6]
	bl SetFlag
	adds r4, #0xc
_080D416C:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080D4164
	pop {r4}
	pop {r0}
	bx r0

