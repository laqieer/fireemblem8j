	.syntax unified
	.set ClearSmallStringBuffer, 0x08003814 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_800382C, "ax", %progbits
@ sub_800382C @ JP 0x0800382C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800382C
	.thumb_func
sub_800382C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ClearSmallStringBuffer
	movs r6, #7
	b _0800383E
_08003838:
	subs r6, #1
	cmp r6, #0
	blt _0800385C
_0800383E:
	ldr r4, _08003864 @ =0x02028E44
	adds r4, r6, r4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _08003838
_0800385C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003864: .4byte 0x02028E44

