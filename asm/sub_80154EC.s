	.syntax unified
	.set DecayTraps, 0x0802E9F8 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80154EC, "ax", %progbits
@ sub_80154EC @ JP 0x080154EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80154EC
	.thumb_func
sub_80154EC:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08015508 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	bne _08015510
	ldr r0, _0801550C @ =0x085C4280
	bl Proc_StartBlocking
	bl DecayTraps
	movs r0, #0
	b _08015512
	.align 2, 0
_08015508: .4byte 0x0202BCEC
_0801550C: .4byte 0x085C4280
_08015510:
	movs r0, #1
_08015512:
	pop {r1}
	bx r1
	.align 2, 0

