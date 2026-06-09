	.syntax unified
	.section .text.GetExtraMapMapSize, "ax", %progbits
@ GetExtraMapMapSize @ JP 0x080AB5A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetExtraMapMapSize
	.thumb_func
GetExtraMapMapSize:
	push {lr}
	ldr r2, _080AB5BC @ =0x0203EF40
	ldr r1, [r2]
	ldr r0, _080AB5C0 @ =0x50414D58
	cmp r1, r0
	bne _080AB5C4
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	b _080AB5C6
	.align 2, 0
_080AB5BC: .4byte 0x0203EF40
_080AB5C0: .4byte 0x50414D58
_080AB5C4:
	movs r0, #0
_080AB5C6:
	pop {r1}
	bx r1
	.align 2, 0

