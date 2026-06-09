	.syntax unified
	.section .text.GetExtraMapInfoReadAddr, "ax", %progbits
@ GetExtraMapInfoReadAddr @ JP 0x080AB5CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetExtraMapInfoReadAddr
	.thumb_func
GetExtraMapInfoReadAddr:
	push {lr}
	ldr r2, _080AB5DC @ =0x0203EF40
	ldr r1, [r2]
	ldr r0, _080AB5E0 @ =0x50414D58
	cmp r1, r0
	bne _080AB5E4
	ldr r0, [r2, #0x18]
	b _080AB5E6
	.align 2, 0
_080AB5DC: .4byte 0x0203EF40
_080AB5E0: .4byte 0x50414D58
_080AB5E4:
	movs r0, #0
_080AB5E6:
	pop {r1}
	bx r1
	.align 2, 0

