	.syntax unified
	.section .text.MakeBgmOverridePersist, "ax", %progbits
@ MakeBgmOverridePersist @ JP 0x0800265C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MakeBgmOverridePersist
	.thumb_func
MakeBgmOverridePersist:
	push {lr}
	ldr r0, _08002678 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r2, r0, #0x1f
	cmp r2, #0
	bne _08002674
	ldr r0, _0800267C @ =0x02024E5C
	ldrh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #2]
_08002674:
	pop {r0}
	bx r0
	.align 2, 0
_08002678: .4byte 0x0202BCEC
_0800267C: .4byte 0x02024E5C

