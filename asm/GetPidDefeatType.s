	.syntax unified
	.section .text.GetPidDefeatType, "ax", %progbits
@ GetPidDefeatType @ JP 0x080BB21C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetPidDefeatType
	.thumb_func
GetPidDefeatType:
	push {lr}
	adds r2, r0, #0
	ldr r1, _080BB224 @ =0x08AC0AF8
	b _080BB234
	.align 2, 0
_080BB224: .4byte 0x08AC0AF8
_080BB228:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080BB232
	ldrb r0, [r1, #1]
	b _080BB23C
_080BB232:
	adds r1, #4
_080BB234:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080BB228
	movs r0, #0
_080BB23C:
	pop {r1}
	bx r1

